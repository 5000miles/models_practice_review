#!/usr/bin/env python
# coding: utf-8

# In[1]:


# Import libraries here.
import pandas as pd
import numpy as np
import os

files = os.listdir('data/')
plu = pd.read_csv("plu-codes.csv")

def process_data(file, city):
    
    file_path = 'data/'+file
    date = file.split('.')[0]
    
    data = pd.read_excel(file_path, sheet_name=city)
    
    data['price_usd'] = data['price_eu'] * 1.1
    data['weight_lb'] = data['weight_kg'] * 2.2
    data = data.merge(plu,how='left',left_on='prodcode',right_on='plu_code')
    
    data = data.drop(['price_eu','weight_kg','plu_code'], axis=1)
    
    data['date'] = date
    
    return data

city_dict = {
    "Atlanta": "atl.csv",
    "Austin": "atx.csv",
    "Boston": "bos.csv",
    "Chicago": "chi.csv",
    "Denver": "den.csv",
    "Los Angeles": "lax.csv",
    "New York": "nyc.csv",
    "San Francisco": "sf.csv",
    "Seattle": "sea.csv",
    "Washington, DC": "dc.csv"
}


try:
    os.mkdir('output')
    for city in city_dict:
        file_name = city_dict[city]
        final_path = 'output/'+file_name

        list_df = [process_data(filename, city) for filename in files if not filename.startswith('~')]
        concat_df = pd.concat(list_df,ignore_index=True)
        concat_df['city'] = city

        concat_df = concat_df.loc[:,['city','date','product','prodcode','quantity','weight_lb','price_usd']]

        concat_df.to_csv(final_path,index=False)
        
except FileExistsError:
    print("folder already exists")

