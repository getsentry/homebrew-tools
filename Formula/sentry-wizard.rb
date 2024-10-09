require 'language/node'
class SentryWizard < Formula
  desc "The Sentry Wizard helps you set up your projects with Sentry"
  homepage "https://github.com/getsentry/sentry-wizard"
  url "https://registry.npmjs.org/@sentry/wizard/-/wizard-3.33.0.tgz"
  sha256 "9659311d3d1537d3013047dddf32d497edc1f76f01a92b19dc2d0950edfbff5c"
  version "3.33.0"
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
