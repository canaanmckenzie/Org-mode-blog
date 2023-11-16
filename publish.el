(require 'ox-publish)

(setq org-html-validation-link nil) ;;disable html validation link


(setq org-publish-project-alist
      `(("pages" ;;handles org files to export to html
         :base-directory "./org/"
         :base-extension "org"
         :recursive t
          :publishing-directory "./html/"
         :publishing-function org-html-publish-to-html
         :with-toc nil
         :section-numbers nil
         :time-stamp-file nil
        :with-author nil
        :with-creator t
        :html-doctype "html5"
        :html-html5-fancy t
       :html-head-include-scripts nil
        :html-head-include-default-style nil

        ;;add custom preamble (nav) and postamble (footer)
        :html-preamble "<nav>
           <a href=\"/\">&lt; Home</a>
                                      </nav>"

        :html-postamble "<hr/>
<footer>
  <div class=\"copyright-container\">
    <div class=\"copyright\">
      Copyright &copy; 2012-2023 Canaan McKenzie<br/>
    </div>
  </div>

  <div class=\"generated\">
    Created with %c
  </div>
</footer>"

       :html-head "<link rel=\"stylesheet\" href=\"/style.css\" type=\"text/css\"/>")

        ("static" ;;handles static components like img and stylesheets
         :base-directory "./org"
         :base-extension "css\\|txt\\|jpg\\|gif\\|png"
        :recursive t
        :publishing-directory "./html/"
        :publishing-function org-publish-attachment)
     
       ("org-blog" :components ("pages" "static"))))

;;generate the blog
(org-publish "org-blog"  t)
(message "Build Complete!") 
