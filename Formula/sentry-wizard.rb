require 'language/node'
class SentryWizard < Formula
  desc "The Sentry Wizard helps you set up your projects with Sentry"
  homepage "https://github.com/getsentry/sentry-wizard"
  url "https://registry.npmjs.org/@sentry/wizard/-/wizard-7.0.3.tgz"
  sha256 "4b5996b7d646cab4a90642255d1b6e22467fa74e1c38430a8b165aa5d12aa3b8"
  version "7.0.3"
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
