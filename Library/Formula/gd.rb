  url "http://www.libgd.org/releases/gd-2.0.36RC1.tar.gz"
  head "http://bitbucket.org/pierrejoye/gd-libgd/"
  def patches
    DATA
  end

    inreplace "gdlib.pc", "PREFIX", prefix
    (lib+'pkgconfig').install "gdlib.pc"

__END__
diff --git a/gdlib.pc b/gdlib.pc
new file mode 100644
index 0000000..91fe011
--- /dev/null
+++ b/gdlib.pc
@@ -0,0 +1,15 @@
+prefix=PREFIX
+exec_prefix=${prefix}
+libdir=/${exec_prefix}/lib
+includedir=/${prefix}/include
+bindir=/${prefix}/bin
+ldflags=  -L/${prefix}/lib
+
+
+Name: gd
+Description: A graphics library for quick creation of PNG or JPEG images
+Version: 2.0.36RC1
+Requires:
+Libs: -L${libdir} -lgd
+Libs.private: -lXpm -lX11 -ljpeg -lfontconfig -lfreetype -lpng12 -lz -lm
+Cflags: -I${includedir}