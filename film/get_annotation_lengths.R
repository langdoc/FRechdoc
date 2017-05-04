#!/usr/bin/env Rscript

# In order to make this script run it is necessary to install following packages:

# install.packages('tidyverse')

args = commandArgs(trailingOnly=TRUE)

# test if there is one argument: if not, return an error
if (length(args)!=1) {
        stop("One argument that specifies the input file must be given.\nFor example: Rscript get_annotation_lengths.R elan_file.eaf", call.=FALSE)
}

library(methods)

suppressPackageStartupMessages(library(tidyverse))
library(xml2)

retrieve_tier <- function(eaf_xml, tier_prefix){
        eaf_xml %>% 
                xml_find_all(paste0("//TIER[starts-with(@TIER_ID,'", tier_prefix, "')]")) %>%
                map_df(., ~ data_frame(content = .x %>% 
                                    xml_find_all('ANNOTATION/*/ANNOTATION_VALUE') %>% 
                                    xml_text,
                            participant = .x %>% xml_attr('PARTICIPANT'),
                            a_id = .x %>%
                                    xml_find_all('ANNOTATION/*') %>%
                                    xml_attr('ANNOTATION_ID'),
                            ref_id = .x %>%
                                    xml_find_all('ANNOTATION/*') %>%
                                    xml_attr('ANNOTATION_REF'),
                            ts_1 = .x %>% xml_find_all('ANNOTATION/*') %>%
                                    xml_attr('TIME_SLOT_REF1'),
                            ts_2 = .x %>% xml_find_all('ANNOTATION/*') %>%
                                    xml_attr('TIME_SLOT_REF2')))
}

eaf_xml <- read_xml(args[1])

eaf <- eaf_xml %>% 
        retrieve_tier('ref') %>% 
        select(-ref_id) %>%
        dplyr::rename(ref_id = a_id,
                      reference = content) %>%
        split(.$ref_id) %>%
        map(., ~ .x %>% 
                    mutate(time_start = eaf_xml %>%
                    xml_find_first(paste0("//TIME_SLOT[@TIME_SLOT_ID='", .x$ts_1[1] ,"']")) %>%
                    xml_attr('TIME_VALUE') %>% as.numeric())) %>%
        map(., ~ .x %>% 
                    mutate(time_end = eaf_xml %>%
                    xml_find_first(paste0("//TIME_SLOT[@TIME_SLOT_ID='", .x$ts_2[1] ,"']")) %>%
                    xml_attr('TIME_VALUE') %>% as.numeric())) %>%
        bind_rows %>%
        left_join(
                retrieve_tier(eaf_xml, 'orth') %>%
                        dplyr::rename(orth_id = a_id,
                                      utterance = content) %>%
                        select(-ts_1, -ts_2),
                by = c("participant", "ref_id")) %>%
        left_join(
                retrieve_tier(eaf_xml, 'ft-en') %>%
                        dplyr::rename(orth_id = ref_id,
                                      ft_eng = content) %>%
                        select(-ts_1, -ts_2, -a_id),
                by = c("participant", "orth_id")
        ) %>% mutate(utterance_length = time_end - time_start)

paste('Segments with annotations:', lubridate::seconds_to_period(sum(eaf %>% .$utterance_length) / 1000))
paste('Segments with English translations:', lubridate::seconds_to_period(sum(eaf %>% filter(ft_eng != '') %>% .$utterance_length) / 1000))
paste('Segments with no Cyrillic characters:', lubridate::seconds_to_period(sum(eaf %>% filter(! stringr::str_detect(utterance, '[А-Яа-яӧі]')) %>% .$utterance_length) / 1000))
paste('Segments which contain Cyrillic characters:', lubridate::seconds_to_period(sum(eaf %>% filter(stringr::str_detect(utterance, '[А-Яа-яӧі]')) %>% .$utterance_length) / 1000))
