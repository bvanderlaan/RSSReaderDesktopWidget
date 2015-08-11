/*
 * Copyright 2015 ImaginativeThinking
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "WidgetPositioner.hpp"

using namespace ImaginativeThinking::RSSReader;

///////////////////////////////////////////////////////////////////////////////////////////////////////////
WidgetPositioner::WidgetPositioner(QObject *parent) :
    QObject(parent),
    m_widgetPosition(0,0),
    m_screenPosition( ScreenPosition_Left ),
    m_widgetSize(0,0)
{
    connect(this, WidgetPositioner::screenNumberChanged, WidgetPositioner::updateWidgetPosition );
    connect(this, WidgetPositioner::screenPositionChanged, WidgetPositioner::updateWidgetPosition );
    connect(this, WidgetPositioner::widgetSizeChanged, WidgetPositioner::updateWidgetPosition );
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
int WidgetPositioner::getXPosition() const
{
    return m_widgetPosition.x();
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
int WidgetPositioner::getYPosition() const
{
    return m_widgetPosition.y();
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
int WidgetPositioner::getScreenNumber() const
{
    return m_screenNumber;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
void WidgetPositioner::setScreenNumber(int number)
{
    if ( (number != m_screenNumber) && ( number <= m_desktopWidget.screenCount() ))
    {
        m_screenNumber = number;
        emit screenNumberChanged( m_screenNumber );
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
WidgetPositioner::ScreenPosition WidgetPositioner::getScreenPosition() const
{
    return m_screenPosition;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
void WidgetPositioner::setScreenPosition(WidgetPositioner::ScreenPosition position)
{
    if ( position != m_screenPosition )
    {
        m_screenPosition = position;
        emit screenPositionChanged(m_screenPosition);
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
QSize WidgetPositioner::getWidgetSize() const
{
    return m_widgetSize;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
void WidgetPositioner::setWidgetSize(QSize size)
{
    if ( m_widgetSize != size )
    {
        m_widgetSize = size;
        emit widgetSizeChanged( m_widgetSize );
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
void WidgetPositioner::updateWidgetPosition()
{
    auto screen = m_desktopWidget.screen(m_screenNumber - 1);

    switch( m_screenPosition )
    {
        case ScreenPosition_Right:
            m_widgetPosition.setX( screen->x() + ( screen->width() - m_widgetSize.width() ) );
            break;
        case ScreenPosition_Left:
        default:
            m_widgetPosition.setX( screen->x() );
            break;
    }
    emit widgetPositionChanged();
}
