cmake_minimum_required(VERSION 3.16)

project(Moh3D VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick Quick3D)

qt_standard_project_setup(REQUIRES 6.5)

# Get a list of all of the files in the data folder.
file(GLOB_RECURSE BUNDLED_RESOURCES "${CMAKE_CURRENT_SOURCE_DIR}/data/*")

# for anything that is not macOS/iOS just copy the files to the build folder
foreach(file ${BUNDLED_RESOURCES})
    # To recreate the same folder structure we first need to read the base folder
    file(RELATIVE_PATH RELATIVE_FILE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/data" ${file})
    get_filename_component(FOLDER ${RELATIVE_FILE_PATH} DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/data")
    file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/data/${FOLDER} )
        message(STATUS "COPY ${file} -> ${CMAKE_CURRENT_BINARY_DIR}/data/${RELATIVE_FILE_PATH}")
        configure_file(${file} "${CMAKE_CURRENT_BINARY_DIR}/data/${RELATIVE_FILE_PATH}" COPYONLY)
endforeach()

qt_add_executable(moh3D
    main.cpp
    ${BUNDLED_RESOURCES}
)


qt_add_qml_module(moh3D
  URI Moh3D
  VERSION 1.0
  QML_FILES
    Main.qml
    QML_FILES MyModel.qml
    QML_FILES OriginGizmo.qml
    DynamicItemLoader.qml
    DynamicNodeLoader.qml

    SOURCES
      dynamicfileshelper.h dynamicfileshelper.cpp
    RESOURCES
      SOURCES texturedatabaker.h texturedatabaker.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(moh3D PROPERTIES
  MACOSX_BUNDLE_GUI_IDENTIFIER com.example.Moh3D
  MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
  MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
  MACOSX_BUNDLE TRUE
  WIN32_EXECUTABLE TRUE
)

target_link_libraries(moh3D
  PRIVATE Qt6::Quick
  Qt6::Quick3D

)

# For qmlls to have completion for the TrainingSandbox module, we need to ship some build artifacts along with the app
set(MOH3D_DIR "${CMAKE_CURRENT_BINARY_DIR}/Moh3D")

# Use GLOB to collect files based on the patterns you've specified.
file(GLOB MOH3D_QML_FILES "${MOH3D_DIR}/*.qml")
file(GLOB MOH3D_QMLDIR_FILES "${MOH3D_DIR}/qmldir")
file(GLOB MOH3D_QMLTYPES_FILES "${MOH3D_DIR}/*.qmltypes")

# The destination directory
set(MOH3D_DEST_DIR "${CMAKE_CURRENT_BINARY_DIR}/qmlls_data/Moh3D")

# Define a post-build command to copy the files.
add_custom_command(
  TARGET moh3D
  POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E make_directory "${MOH3D_DEST_DIR}"
  COMMAND ${CMAKE_COMMAND} -E copy ${MOH3D_QML_FILES} ${MOH3D_QMLDIR_FILES} ${MOH3D_QMLTYPES_FILES} "${MOH3D_DEST_DIR}"
  COMMENT "Copying QML files to ${MOH3D_DEST_DIR}"
)

include(GNUInstallDirs)
install(TARGETS moh3D
  BUNDLE DESTINATION .
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
