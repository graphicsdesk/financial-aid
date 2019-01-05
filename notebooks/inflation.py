import pandas as pd

# Source: https://www.usinflationcalculator.com/inflation/consumer-price-index-and-annual-percent-changes-from-1913-to-2008/
cpiData = pd.read_csv('../data/ConsumerPriceIndexData.csv').set_index('Year')

# Returns a function that adjusts nominal dollars to [month] 2016 dollars.
def inflationAdjuster(month, baseYear=2016):
    finalCpi = cpiData.loc[baseYear][month]
    def adjust(dollars, year):
        if dollars is None:
            return
        initCpi = cpiData.loc[year][month]
        return dollars * finalCpi / initCpi
    return adjust
