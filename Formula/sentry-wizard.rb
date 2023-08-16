require 'require/node'

class SentryWizard < Formula
    desc "The Sentry Wizard helps you set up your projects with Sentry"
    homepage "https://github.com/getsentry/sentry-wizard"
    sha256 "1933d0ccf7c4afa7d9672c0cba647fc30fff221d2c5a8102862247128ee600bb"
    version "3.9.2"
    license "MIT"

    depends_on "node"
    
    def install
      system "npm", "install", *Language::Node.std_npm_install_args(libexec)
      bin.install_symlink Dir["#{libexec}/bin/*"]
    end
    test do
      assert_match version.to_s, shell_output("#{bin}/sentry-wizard --version").chomp
    end
  end
