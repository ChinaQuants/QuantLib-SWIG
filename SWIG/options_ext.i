/*
 Copyright (C) 2018 Cheng Li

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

#ifndef quantlib_options_ext_i
#define quantlib_options_ext_i

%include options.i

%{
using QuantLib::SpreadOption;
typedef boost::shared_ptr<Instrument> SpreadOptionPtr;
%}

%rename(SpreadOption) SpreadOptionPtr;
class SpreadOptionPtr : public boost::shared_ptr<Instrument> {
    SpreadOptionPtr(
                const boost::shared_ptr<Payoff>& payoff,
                const boost::shared_ptr<Exercise>& exercise) {
            boost::shared_ptr<PlainVanillaPayoff> stPayoff =
                 boost::dynamic_pointer_cast<PlainVanillaPayoff>(payoff);
            QL_REQUIRE(stPayoff, "wrong payoff given");
            return new SpreadOptionPtr(new SpreadOption(stPayoff, exercise));
        }
};

%{
using QuantLib::KirkSpreadOptionEngine;
%}

#endif