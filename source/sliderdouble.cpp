//  EyeStalker: robust video-based eye tracking
//  Copyright (C) 2016  Terence Brouns, t.s.n.brouns@gmail.com

//  EyeStalker is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.

//  EyeStalker is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.

//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>

#include "sliderdouble.h"

SliderDouble::SliderDouble(QWidget *parent) : QSlider(parent)
{
    QObject::connect(this, SIGNAL(valueChanged(int)), this, SLOT(notifyValueChanged(int)));
    precision = 10.0;
}

void SliderDouble::setDoubleValue(double val)
{
    this->setValue(round(precision * val));
}

void SliderDouble::setDoubleRange(double min, double max)
{
    this->setRange(round(precision * min), round(precision * max));
}

void SliderDouble::setDoubleMaximum(double max)
{
    this->setMaximum(round(precision * max));
}

void SliderDouble::setDoubleMinimum(double min)
{
    this->setMinimum(round(precision * min));
}

void SliderDouble::setPrecision(int val)
{
    precision = pow(10, val);
}
