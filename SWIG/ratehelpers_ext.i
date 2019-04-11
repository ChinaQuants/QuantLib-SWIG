
/*
 Copyright (C) 2009 Cheng Li

 This file is part of QuantLib, a free-software/open-source library
 for financial quantitative analysts and developers - http://quantlib.org/

 QuantLib is free software: you can redistribute it and/or modify it
 under the terms of the QuantLib license.  You should have received a
 copy of the license along with this program; if not, please email
 <quantlib-dev@lists.sf.net>. The license is also available online at
 <http://quantlib.org/license.shtml>.

 This program is distributed in the hope that it will be useful, but WITHOUT
 ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 FOR A PARTICULAR PURPOSE.  See the license for more details.
*/

#ifndef quantlib_rate_helpers_ext_i
#define quantlib_rate_helpers_ext_i

%include ratehelpers.i
%include swap_ext.i
%include indexes_ext.i

%{

#include <qlext/termstructures/yield/ratehelpers.hpp>

using QuantLib::ShiborSwapRateHelper;
using QuantLib::SubPeriodsSwapRateHelper;

%}

%shared_ptr(ShiborSwapRateHelper)
class ShiborSwapRateHelper: public RateHelper {
  public:
    ShiborSwapRateHelper(
                const Handle<Quote>& rate,
                const Period& swapTenor,
                Frequency fixedFreq,
                const boost::shared_ptr<Shibor>& shiborIndex,
                const Period& fwdStart = 0*Days,
                const Handle<YieldTermStructure>& discountingCurve
                                            = Handle<YieldTermStructure>());

    boost::shared_ptr<ShiborSwap> swap();
};

%shared_ptr(SubPeriodsSwapRateHelper)
class SubPeriodsSwapRateHelper: public RateHelper {
  public:
    SubPeriodsSwapRateHelper(const Handle<Quote>& rate, const Period& swapTenor, Frequency fixedFreq,
                                 const Calendar& fixedCalendar, const DayCounter& fixedDayCount,
                                 BusinessDayConvention fixedConvention, const Period& floatPayTenor,
                                 const boost::shared_ptr<IborIndex>& iborIndex, const DayCounter& floatingDayCount,
                                 DateGeneration::Rule rule = DateGeneration::Backward,
                                 QuantLib::Ext::SubPeriodsCoupon::Type type = QuantLib::Ext::SubPeriodsCoupon::Compounding,
                                 const Period& fwdStart = 0 * Days,
                                 const Handle<YieldTermStructure>& discountingCurve = Handle<YieldTermStructure>());
};

#endif