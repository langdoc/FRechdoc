#!/Users/niko/anaconda3/bin/python
import pympi
import glob
import os

elan_files = glob.glob('{}/song1/*.eaf'.format('.'))

new_eaf = pympi.Elan.Eaf()
new_eaf.add_linguistic_type(lingtype='utterance', timealignable=True)

for eaf in elan_files:
    eaf_ob = pympi.Elan.Eaf(eaf)
    current_tier = os.path.splitext(os.path.basename(eaf))[0]
    eaf_ob.copy_tier(eaf_obj = new_eaf, tier_name = 'tier1')
    new_eaf.rename_tier(id_from = 'tier1', id_to = current_tier)

new_eaf.to_file(file_path = 'song1/song1.eaf')
