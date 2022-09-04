import os

directory = 'moneypuck/playerData/playerGameByGame/2022/regular/'

filenames = []

for filename in os.listdir(directory):
    filepath = directory + filename 
    filenames.append(filepath)
    
df2022 = pd.concat(
map(pd.read_csv, filenames), ignore_index=True)

df_data = pd.concat([df2017,df2018,df2019,df2020,df2021])
