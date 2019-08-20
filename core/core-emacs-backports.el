;;; core-emacs-backports.el --- Spacemacs Core File
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(when (and (version<  "25" emacs-version)
           (version< emacs-version "26.3"))
  ;; Hack to prevent TLS error with Emacs 26.1 and 26.2 and gnutls 3.6.4 and above
  ;; see https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341
  (with-current-buffer (url-retrieve-synchronously "https://api.github.com/users/syl20bnr/repos")
    (when (string-empty-p (buffer-string))
      (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))))

(provide 'core-emacs-backports)
