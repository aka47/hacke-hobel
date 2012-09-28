# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

include Nanoc::Helpers::Rendering

# in thumbs folder
# mogrify  -format jpg -thumbnail 250x250 -auto-orient  -unsharp 0x.5  '*jpg'
def bilder(type)
  Dir["output/bilder/#{type}/*.*"].map do |bild|
    "<a class='fancybox' rel='#{type}' href='/bilder/#{type}/#{File.basename(bild)}'><img src='/bilder/#{type}/thumbs/#{File.basename(bild)}' alt='' /></a>"
  end.join("")
end

def fancybox
  <<-END
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <link rel="stylesheet" href="/fb/jquery.fancybox.css?v=2.1.0" type="text/css" media="screen" />
    <script type="text/javascript" src="/fb/jquery.fancybox.pack.js?v=2.1.0"></script>
    <script>
      $(document).ready(function() {
        $(".fancybox").fancybox({
          openEffect  : 'none',
          closeEffect : 'none'
        });
      });
    </script>
  END
end
