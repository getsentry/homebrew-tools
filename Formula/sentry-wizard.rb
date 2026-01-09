require 'language/node'
class SentryWizard < Formula
  desc "The Sentry Wizard helps you set up your projects with Sentry"
  homepage "https://github.com/getsentry/sentry-wizard"
  url "https://registry.npmjs.org/@sentry/wizard/-/wizard-6.11.0.tgz"
  sha256 "2bc8276559329f6f89e8990352de92d47f9f3920399229d4982e503d61830f75"
  version "6.11.0"
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
