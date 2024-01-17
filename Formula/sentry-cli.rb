class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.25.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.25.1/sentry-cli-Darwin-universal"
    sha256 "c510cc860aa10df5531b539da1c060241c00187b4aa9b084a7472dee1fcfc6fc"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.25.1/sentry-cli-Linux-aarch64"
        sha256 "bf9140ac1db2046652b98a3fa9d0e057afb7e5e4e7be0eae88c6117932f3a4a7"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.25.1/sentry-cli-Linux-armv7"
        sha256 "eaa15fe0bf9a448e200379b11a8103f9e42c3a37657c4cd7c9215547f8873340"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.25.1/sentry-cli-Linux-x86_64"
        sha256 "726afb38480f720546ab182e317c8102faaf54d1bc54bfc61de47dd86f170b93"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.25.1/sentry-cli-Linux-i686"
        sha256 "391809a9275827f2dc52f708f00cb4bf7c0bbbe6e56a6a683eb536a6f22b9beb"
      end
    else
      raise "Unsupported architecture"
    end
  else
      raise "Unsupported operating system"
  end
  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
