dnl -------------------------------------------------------------
dnl GMV file I/O API for reading GMV files, by Frank Ortega
dnl -------------------------------------------------------------
AC_DEFUN([CONFIGURE_GMV],
[
  AC_ARG_ENABLE(gmv,
                AS_HELP_STRING([--disable-gmv],
                               [build without GMV file I/O support]),
		[case "${enableval}" in
		  yes)  enablegmv=yes ;;
		   no)  enablegmv=no ;;
 		    *)  AC_MSG_ERROR(bad value ${enableval} for --enable-gmv) ;;
		 esac],
		 [enablegmv=$enableoptional])



  dnl The GMV API is distributed with libmesh, so we don't have to guess
  dnl where it might be installed...
  if (test x$enablegmv = xyes); then
     GMV_INCLUDE="-I\$(top_srcdir)/contrib/gmv"
     GMV_LIBRARY="\$(EXTERNAL_LIBDIR)/libgmv\$(libext)"
     AC_DEFINE(HAVE_GMV, 1, [Flag indicating whether the library will be compiled with GMV support])
     AC_MSG_RESULT(<<< Configuring library with GMV support >>>)
  else
     GMV_INCLUDE=""
     GMV_LIBRARY=""
     enablegmv=no
  fi

  AC_SUBST(GMV_INCLUDE)
  AC_SUBST(GMV_LIBRARY)
])
