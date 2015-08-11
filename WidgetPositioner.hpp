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

#ifndef WIDGETPOSITIONER_HPP
#define WIDGETPOSITIONER_HPP

#include <QObject>
#include <QPoint>
#include <QDesktopWidget>

namespace ImaginativeThinking
{
    namespace RSSReader
    {
        class WidgetPositioner : public QObject
        {
            Q_OBJECT
            Q_PROPERTY(int x READ getXPosition NOTIFY widgetPositionChanged )
            Q_PROPERTY(int y READ getYPosition NOTIFY widgetPositionChanged )
            Q_PROPERTY(int screenNumber READ getScreenNumber WRITE setScreenNumber NOTIFY screenNumberChanged )
            Q_PROPERTY(ScreenPosition screenPosition READ getScreenPosition WRITE setScreenPosition NOTIFY screenPositionChanged)
            Q_PROPERTY(QSize widgetSize READ getWidgetSize WRITE setWidgetSize NOTIFY widgetSizeChanged )
            Q_ENUMS( ScreenPosition )
        public:
            explicit WidgetPositioner(QObject *parent = 0);
            virtual ~WidgetPositioner() {}

            enum ScreenPosition
            {
                ScreenPosition_Left,
                ScreenPosition_Right,
            };

            int getXPosition() const;
            int getYPosition() const;
            int getScreenNumber() const;
            void setScreenNumber( int number );
            ScreenPosition getScreenPosition() const;
            void setScreenPosition( ScreenPosition position );
            QSize getWidgetSize() const;
            void setWidgetSize( QSize size );

        signals:
            void widgetPositionChanged();
            void screenNumberChanged(int screenNumber );
            void screenPositionChanged(ScreenPosition position);
            void widgetSizeChanged(QSize size);

        private:
            QPoint m_widgetPosition;
            QDesktopWidget m_desktopWidget;
            int m_screenNumber;
            ScreenPosition m_screenPosition;
            QSize m_widgetSize;

        private slots:
            void updateWidgetPosition();
        };
    }
}

#endif // WIDGETPOSITIONER_HPP
