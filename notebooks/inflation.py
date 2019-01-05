import pandas as pd

cpiData = pd.read_csv('../data/ConsumerPriceIndexData.csv').set_index('Year')

# Returns a function that adjusts nominal dollars to [month] 2016 dollars.
def inflationAdjuster(month):
    finalCpi = cpiData.loc[2016][month]
    def adjust(dollars, year):
        if dollars is None:
            return
        initCpi = cpiData.loc[year][month]
        return dollars * finalCpi / initCpi
    return adjust

