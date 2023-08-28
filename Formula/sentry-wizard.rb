require 'language/node'

class SentryWizard < Formula
  desc "The Sentry Wizard helps you set up your projects with Sentry"
  homepage "https://github.com/getsentry/sentry-wizard"
  url "https://registry.npmjs.org/@sentry/wizard/-/wizard-3.10.0.tgz"
  sha256 "d1ccf352373e2b691192ba00a2e93721014cca6efb48966291297f9e62158d3a"
  version "3.10.0"
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
