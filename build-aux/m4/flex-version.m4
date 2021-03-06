# FLEX_VERSION()
# ----------------------------------------------------
# Define macros used to access flex version outside the file
# generated by flex.

AC_DEFUN([FLEX_VERSION],
[FLEX_MAJOR_VERSION=$(flex --version |
                      perl -ne 'm/(\d+)\.(\d+)(?:\.(\d+))?/ && print($[1])')
FLEX_MINOR_VERSION=$(flex --version |
                      perl -ne 'm/(\d+)\.(\d+)(?:\.(\d+))?/ && print($[2])')
FLEX_SUBMINOR_VERSION=$(flex --version |
                      perl -ne 'm/(\d+)\.(\d+)(?:\.(\d+))?/ && print($[3])')
AC_DEFINE_UNQUOTED([FLEX_MAJOR_VERSION], [$FLEX_MAJOR_VERSION],
                   [Define to the Flex major version.])
AC_DEFINE_UNQUOTED([FLEX_MINOR_VERSION], [$FLEX_MINOR_VERSION],
                   [Define to the Flex minor version.])
AC_DEFINE_UNQUOTED([FLEX_SUBMINOR_VERSION], [$FLEX_SUBMINOR_VERSION],
                   [Define to the Flex subminor version.])])
