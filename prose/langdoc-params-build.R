rmarkdown::render('langdoc-params.Rmd', output_file = 'langdoc-KSDP.html', params = list(
  language = 'Kildin Saami',
  project = 'KSDP',
  directory = '~/Dropbox/FRorpus/',
  tier_prefix = 'word@'
))

rmarkdown::render('langdoc-params.Rmd', output_file = 'langdoc-IKDP.html', params = list(
        language = 'Iźva Komi',
        project = 'ISDP',
        directory = '/Volumes/langdoc/langs/kpv/',
        tier_prefix = 'word@'
))
