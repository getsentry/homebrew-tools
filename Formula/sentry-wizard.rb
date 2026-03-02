require 'language/node'
class SentryWizard < Formula
  desc "The Sentry Wizard helps you set up your projects with Sentry"
  homepage "https://github.com/getsentry/sentry-wizard"
  url "https://registry.npmjs.org/@sentry/wizard/-/wizard-6.12.0.tgz"
  sha256 "9af893ef910c8c2bfc3f802054c79dda770d45a4aac3abdce25a28bf4e657991"
  version "6.12.0"
  license "FSL-1.1-MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-wizard --version").chomp
  end
end
