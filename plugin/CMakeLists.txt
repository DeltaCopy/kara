set(kara_source
        pagermodel.cpp
        pagermodel.h
        windowmodel.cpp
        windowmodel.h
)

find_package(LibTaskManager REQUIRED)

qt_add_qml_module(kara
    URI "org.dhruv8sh.kara"
    VERSION 1.0
    SOURCES ${kara_source}
)

set_target_properties(karaplugin PROPERTIES
    PREFIX "lib"
)

target_include_directories(kara PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
)

target_link_libraries(kara
    PRIVATE
        Qt::Core
        Qt::DBus
        Qt::Qml
        Qt::Widgets
		Qt::Quick
        KF6::I18n
        KF6::Service
        KF6::WindowSystem
        KWin::kwin
        Plasma::Plasma
        Plasma::Activities
		PW::LibTaskManager
)

install(TARGETS kara
    DESTINATION ${KDE_INSTALL_LIBDIR}
)

install(TARGETS karaplugin
    DESTINATION ${KDE_INSTALL_QMLDIR}/org/dhruv8sh/kara
)

install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/qmldir
    ${CMAKE_CURRENT_BINARY_DIR}/kara.qmltypes
    DESTINATION ${KDE_INSTALL_QMLDIR}/org/dhruv8sh/kara
)
