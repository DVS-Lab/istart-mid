#!/usr/bin/env python
# coding: utf-8

# In[39]:


import os
import pandas as pd
import re


# In[42]:


task='mid'
bidsdir='/data/projects/istart-data/bids'
allfiles = [os.path.join(root,f) for root,dirs,files in os.walk(bidsdir) for f in files if 
            (('task-%s'%(task) in f))&(f.endswith('events.tsv'))]


# In[ ]:


for f in allfiles:
    sub=re.search('func/sub-(.*)_task',f).group(1)
    task=task
    run=re.search('run-(.*)_events',f).group(1)
    OutDir='/data/projects/istart-mid/derivatives/fsl/EVfiles/sub-%s/SingleTrialEVs/run%s'%(sub,run)
    os.makedirs(OutDir,exist_ok=True)
    df=pd.read_csv(f,sep='\t')
    df=df[~df['trial_type'].str.contains('Con')]
    df['mod']=1
    df['trial']=df.index+1
    for trial in df['trial']:
        Single=df[df['trial']==trial]
        Other=df[df['trial']!=trial]
        
        Single=Single[['onset','duration','mod']]
        Other=Other[['onset','duration','mod']]
        
        Single.to_csv(OutDir+'/trialmodel-%s_estimage-single.tsv'%(trial),
                      sep="\t",header=False,index=False)
        Other.to_csv(OutDir+'/trialmodel-%s_estimage-other.tsv'%(trial),
                     sep="\t",header=False,index=False)

        


# In[53]:





# In[ ]:




