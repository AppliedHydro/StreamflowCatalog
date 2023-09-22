import pandas as pd
from collections import Counter
import matplotlib.pyplot as plt

df = pd.read_excel('C:/Users/sjsch/Desktop/Kendra/Streamflow_Catalog.xlsx',sheet_name='Sheet1')
df.info()

organizations = Counter(df['organization'])
organizations = pd.DataFrame(organizations.items(),columns=['Organization','Quantity'])
organizations['Percentage of Catalog'] = (organizations['Quantity']/organizations['Quantity'].sum()*100)

gage_counts = df.groupby(['organization', 'state'])['lat'].count().reset_index()
states_of_interest = ['Idaho', 'Washington', 'Oregon']
gage_counts_filtered = gage_counts[gage_counts['state'].isin(states_of_interest)]

organizations['Idaho'], organizations['Washington'], organizations['Oregon'] = 0,0,0
for index, row in gage_counts_filtered.iterrows():
    organizations.loc[organizations['Organization'] == row['organization'], row['state']] = row['lat']

organizations['active'], organizations['inactive'] = 0,0
active_count = df.groupby(['organization','status'])['lat'].count().reset_index()
status_interest = ['active','inactive']
filtered_counts = active_count[active_count['status'].isin(status_interest)]

for index, row in filtered_counts.iterrows():
    organizations.loc[organizations['Organization'] == row['organization'], row['status']] = row['lat']
    
def state_plotter(org):
    """
    produces PiPlot that shows percentage of gages associated with input organization
    are in each state of interest. Input variable @org should be organizations name
    as string following expect capitalization. To get list of organizations, type 
    organizations['Organization'] into consule.
    """
    warn_mssg = 'Please try retyping organization name; not found!'
    values = organizations[organizations['Organization'] == org]
    assert len(values) > 0,warn_mssg
    state_counts = [values['Idaho'].sum(),values['Washington'].sum(),values['Oregon'].sum()]
    labels = [organizations.columns[3],organizations.columns[4],organizations.columns[5]]
    fig, ax = plt.subplots()
    explode = (0, 0.1, 0) #sets value for exploded slice
    ax.pie(state_counts,shadow=True,explode=explode,autopct='%1.1f%%',colors=['orange','pink','tomato'],labeldistance=0.7)
    legend_entries = [(f"{labels[0]} {values['Idaho'].sum()}"), (f"{labels[1]} {values['Washington'].sum()}"),(f"{labels[2]} {values['Oregon'].sum()}")]
    plt.legend(legend_entries, loc="best")
    plt.tight_layout()
    plt.show()
    
def active_plotter(org):
    """
    produces PiPlot that shows percentage of gages active and inactive
    for input organization. Input variable @org should be organizations name
    as string following expect capitalization. To get list of organizations, type 
    organizations['Organization'] into consule.
    """
    warn_mssg = 'Please try retyping organization name; not found!'
    values = organizations[organizations['Organization'] == org]
    assert len(values) > 0,warn_mssg
    act_counts = [values['active'].sum(),values['inactive'].sum()]
    labels = [organizations.columns[6],organizations.columns[7]]
    fig, ax = plt.subplots()
    explode = (0, 0.1) #sets value for exploded slice
    ax.pie(act_counts,shadow=True,explode=explode,autopct='%1.1f%%',colors=['orange','tomato'],labeldistance=0.7)
    legend_entries = [(f"{labels[0]} {values['active'].sum()}"), (f"{labels[1]} {values['inactive'].sum()}")]
    plt.legend(legend_entries, loc="best")
    plt.tight_layout()
    plt.show()

def catalog_summary():
    return organizations

def org_summary(org):
    company = organizations[organizations['Organization'] == org]
    return company


