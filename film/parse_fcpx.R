library(tidyverse)
library(xml2)

# This picks all resources
# One could also easily check whether they are present in CMDI files as well
fcpxml_file <- '/Volumes/langdoc/langs/kpv/kpv_izva20150403-1/kpv_izva20150403-1-b/kpv_izva20150403-1-b.fcpxml'
fcpxml <- read_xml(fcpxml_file)

# This gives a nice table of resources

fcpx_time_to_mins <- function(time){
        time %>% stringr::str_replace_all('s', '') %>%
                tibble(string = .) %>%
                mutate(string = ifelse(string == '0', yes = '0/0', no = string)) %>%
                separate(col = string, into = c('sec', 'num'), sep = '/') %>%
                mutate(time = as.numeric(sec) / as.numeric(num)) %>%
                .$time
}

fcpx_media <- left_join(
        fcpxml %>% 
                xml_find_first(paste0("//project[@name='", tools::file_path_sans_ext(basename(fcpxml_file)), "']")) %>%
                xml_find_all('//clip') %>%
                map_df(., ~ tibble(name = .x %>% xml_attr('name') %>% tools::file_path_sans_ext(),
                                   time_offset = .x %>% xml_attr('offset'),
                                   time_duration_clip = .x %>% xml_attr('duration'),
                                   time_start_clip = .x %>% xml_attr('start'),
                                   vol_adjust = .x %>% xml_find_first('adjust-volume') %>% 
                                           xml_attr('amount'))),
                fcpxml %>% 
                xml_find_all('//asset') %>% 
                map_df(., ~ tibble(name = .x %>% xml_attr('name'),
                                   time_start = .x %>% xml_attr('start'),
                                   time_duration_total = .x %>% xml_attr('duration'),
                                   has_audio = .x %>% xml_attr('hasAudio'),
                                   has_video = .x %>% xml_attr('hasVideo'),
                                   audio_sources = .x %>% xml_attr('audioSources'),
                                   audio_channels = .x %>% xml_attr('audioChannels'),
                                   audio_rate = .x %>% xml_attr('audioRate'),
                                   src_path = .x %>% xml_attr('src'))),
        by = 'name')

# library(ggplot2)
# View(fcpx_media)
# str(fcpx_media)

fcpx_media$time_offset = fcpx_time_to_mins(fcpx_media$time_offset)
fcpx_media$time_duration_clip = fcpx_time_to_mins(fcpx_media$time_duration_clip)
fcpx_media$time_duration_total = fcpx_time_to_mins(fcpx_media$time_duration_total)
fcpx_media$time_start_clip = fcpx_time_to_mins(fcpx_media$time_start_clip)
# 
# fcpx_media
# 
fcpx_time_to_mins('48900/2500s')

library(timevis)

session_start <- lubridate::as_datetime('2014-04-03 13:57:08 UTC+2')

session_start + fcpx_media$time_offset

        
fcpx_media %>% select(name, time_start_clip, time_duration_clip, time_offset) %>% 
        mutate(id = name) %>%
        mutate(time_start_clip = ifelse(is.na(time_start_clip), yes = 0, no = time_start_clip)) %>%
        mutate(time_offset = ifelse(is.na(time_offset), yes = 0, no = time_offset)) %>%
        mutate(time_end_clip = time_start_clip + time_duration_clip) %>%
        select(-time_duration_clip) %>%
               rename(content = name,
                      start = time_start_clip,
                      end = time_end_clip) %>%
        mutate(start = session_start + start + time_offset,
               end = session_start + end + time_offset) %>% timevis

# 14:30 2D
