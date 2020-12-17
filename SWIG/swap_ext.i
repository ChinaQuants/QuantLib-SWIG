/*
 Copyright (C) 2017 Cheng Li

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

#ifndef quantlib_swap_ext_i
#define quantlib_swap_ext_i

%include indexes_ext.i
%include swap.i

%{
#include <qlext/instruments/shiborswap.hpp>
#include <qlext/instruments/subperiodsswap.hpp>

using QuantLib::ShiborSwap;
using QuantLib::SubPeriodsSwap;
%}

%shared_ptr(ShiborSwap)
class ShiborSwap : public VanillaSwap {
  public:
    ShiborSwap(VanillaSwap::Type type,
                      Real nominal,
                      Date startDate,
                      const Period& swapTenor,
                      const Period& fixedTenor,
                      Rate fixedRate,
                      const Period& floatTenor,
           const Handle<YieldTermStructure>& h);

    ShiborSwap(VanillaSwap::Type type,
                      Real nominal,
                      Date startDate,
                      const Period& swapTenor,
                      const Period& fixedTenor,
                      Rate fixedRate,
                      const ext::shared_ptr<Shibor>& index);
};

%shared_ptr(SubPeriodsSwap)
class SubPeriodsSwap: public Swap {
  public:
    SubPeriodsSwap(const Date& effectiveDate, Real nominal, const Period& swapTenor, bool isPayer,
                   const Period& fixedTenor, Rate fixedRate, const Calendar& fixedCalendar,
                   const DayCounter& fixedDayCount, BusinessDayConvention fixedConvention, const Period& floatPayTenor,
                   const ext::shared_ptr<IborIndex>& iborIndex, const DayCounter& floatingDayCount,
                   DateGeneration::Rule rule = DateGeneration::Backward);
}; 
 
#endif