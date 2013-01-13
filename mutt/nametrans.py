import re

mapping = { 'INBOX':              'INBOX'
          , '[Gmail]/All Mail':   'all_mail'
          , '[Gmail]/Drafts':     'drafts'
          , '[Gmail]/Important':  'important'
          , '[Gmail]/Sent Mail':  'sent_mail'
          , '[Gmail]/Spam':       'spam'
          , '[Gmail]/Starred':    'starred'
          , '[Gmail]/Trash':      'trash'
          , 'Arch':               'arch'
          , 'hpakage':            'hpakage'
          }

r_mapping = { val: key for key, val in mapping.items() }

def nt_remote(folder):
    try:
        print("remote " + folder)
        return mapping[folder]
    except:
        return re.sub(' ', '_', folder).lower()

def nt_local(folder):
    try:
        print("local " + folder)
        return r_mapping[folder]
    except:
        return re.sub('_', ' ', folder).capitalize()

# folderfilter = exclude(['Label', 'Label', ... ])
def exclude(excludes):
    def inner(folder):
        try:
            excludes.index(folder)
            return False
        except:
            return True

    return inner
