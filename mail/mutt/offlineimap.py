import os
import re
import subprocess

mapping = { 'INBOX': 'INBOX',
            '[Gmail]/All Mail': 'archive',
            '[Gmail]/Drafts': 'drafts',
            '[Gmail]/Sent Mail': 'sent',
            '[Gmail]/Trash': 'trash',
            'EUnet': 'eunet',
            'Hetzner AG': 'hetzner',
            'TyphoonHIL': 'typhoon',
          }

r_mapping = { val: key for key, val in mapping.items() }

def nt_remote(folder):
    return mapping.get(folder, folder)

def nt_local(folder):
    return r_mapping.get(folder, folder)

# folderfilter = exclude(['Label', 'Label', ... ])
def exclude(excludes):
    return lambda folder: not folder in excludes

def get_password(account):
    path = '/home/dejan/.passwd/%s.gpg' % account
    args = ['gpg', '--batch', '--quiet', '-d', path]
    try:
        return subprocess.check_output(args).strip()
    except subprocess.CalledProcessError:
        return None
