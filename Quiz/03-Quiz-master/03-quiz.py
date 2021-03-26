#!/usr/bin/env python
# coding: utf-8

# In[2]:


import pandas as pd
import numpy as np

from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split,cross_val_score
from sklearn.preprocessing import StandardScaler


# In[3]:


df = pd.read_csv('data/nba_rookies.csv')
# df['order'] = df.index


# In[4]:


df = df.set_index('Name')


# In[5]:


df['TARGET_5Yrs'] = df['TARGET_5Yrs'].map(lambda x: 1 if x=='Yes' else 0)


# In[6]:


# df.info()


# In[7]:


# df.isnull().sum()


# In[8]:


df['TARGET_5Yrs'].value_counts()


# In[9]:


df['TARGET_5Yrs'].mean()


# In[10]:


### set X,y
X = df.drop('TARGET_5Yrs',axis=1)
y = df['TARGET_5Yrs']

X_train,X_test,y_train,y_test = train_test_split(X,y,stratify=y,random_state=42)

# sc = StandardScaler()
# X_train_sc = sc.fit_transform(X_train.drop('order',axis=1))
# X_test_sc = sc.fit_transform(X_test.drop('order',axis=1))


sc = StandardScaler()
X_train_sc = sc.fit_transform(X_train)
X_test_sc = sc.fit_transform(X_test)


# In[11]:


### fit model

logreg = LogisticRegression()
logreg.fit(X_train_sc,y_train)
logreg.score(X_train_sc,y_train)


# In[85]:


preds = logreg.predict(X_test_sc)


# In[88]:


player_names = y_test.index


# In[95]:


final_df = pd.DataFrame({'player':player_names,'predictions':preds})


# In[97]:


final_df.to_csv('data/predictions.csv',index=False)


# In[ ]:




