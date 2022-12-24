#!/usr/bin/env python
# coding: utf-8

# In[2]:


import pandas as pd
import numpy as np
import matplotlib
import seaborn as sns
import matplotlib.pyplot as plt
import plotly.express as px
mydata=pd.read_csv("/Users/prakrutikothari/Downloads/Adult_Depression.csv")
mydata.head(10) #To view first 10 rows
mydata.info()


# In[3]:


mydata
  


# In[4]:


Total=pd.read_csv("/Users/prakrutikothari/Downloads/Adult_Depression.csv",index_col ="Strata")


# In[5]:


Total


# In[6]:


Total.drop(["Age","Sex","Education","Income","RaceEthinicity"],axis =0,inplace = True)


# In[7]:


Total


# In[8]:


Total.to_csv('Year.csv', mode='a', index=True, header=True)
 
# print message
print("Data appended successfully.")


# In[9]:


Age=pd.read_csv("/Users/prakrutikothari/Downloads/Adult_Depression.csv",index_col ="Strata")


# In[10]:


Age.drop(["Total","Sex","Education","Income","RaceEthinicity"],axis =0,inplace = True)


# In[52]:


Age


# In[11]:


Age.to_csv('Age.csv', mode='a', index=True, header=True)
 
# print message
print("Data appended successfully.")


# In[56]:


Education=pd.read_csv("/Users/prakrutikothari/Downloads/Adult_Depression.csv",index_col ="Strata")
Education.drop(["Total","Sex","Age","Income","RaceEthinicity"],axis =0,inplace = True)
Education
Education.to_csv('Education.csv', mode='a', index=True, header=True)
 
# print message
print("Data appended successfully.")


# In[58]:


RaceEthinicity=pd.read_csv("/Users/prakrutikothari/Downloads/Adult_Depression.csv",index_col ="Strata")
RaceEthinicity.drop(["Total","Sex","Age","Income","Education"],axis =0,inplace = True)
RaceEthinicity
RaceEthinicity.to_csv('RaceEthinicity.csv', mode='a', index=True, header=True)
 
# print message
print("Data appended successfully.")


# In[59]:


Income=pd.read_csv("/Users/prakrutikothari/Downloads/Adult_Depression.csv",index_col ="Strata")
Income.drop(["Total","Sex","Age","RaceEthinicity","Education"],axis =0,inplace = True)
Income
Income.to_csv('Income.csv', mode='a', index=True, header=True)
 
# print message
print("Data appended successfully.")


# In[60]:


Male1=pd.read_csv("/Users/prakrutikothari/Downloads/Adult_Depression.csv",index_col ="Strata")
Male1.drop(["Total","Income","Age","RaceEthinicity","Education"],axis =0,inplace = True)
Male1
Male1.to_csv('Male1.csv', mode='a', index=True, header=True)
 
# print message
print("Data appended successfully.")


# In[12]:


fig = px.line(Total, x = 'Year', y = 'Frequency', title='Frequency plot from 2012 to 2017')
fig.show()


# In[93]:


import sklearn.linear_model as sk


# In[94]:


reg=sk.LinearRegression()
reg.fit(Total[["Year"]],Total["Frequency"])


# In[96]:


reg.coef_


# In[97]:


reg.intercept_


# In[102]:


X = np.linspace(2020,2040)
Y_PRED= -41.22*X + 84715.12
plt.figure(figsize=(12, 6)
)
plt.plot(X,Y_PRED) 
# regression line
plt.title(
'Prediction for next two decades'
)
plt.xlabel(
'Years'
)
plt.ylabel(
'Total Frequency'
)
plt.show()


# In[78]:


X = np.linspace(2020,2040)


# In[ ]:




