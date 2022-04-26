class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.0.4"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.0.4/sentry-cli-Darwin-universal"
    sha256 "283370a6bf7356a422f39ab805094edefe15f087d512c4579b60e584cf4a3e20"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.4/sentry-cli-Linux-aarch64"
        sha256 "e796a2d535cc59c6d72e5e19aa7604e964328b5a7e09a62f695e0d9acde9b07e"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.4/sentry-cli-Linux-armv7"
        sha256 "19ea3f1a843b37df82b310ab82e330f6f26e4ff8b20b4c98c2a47c894c2164ff"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.4/sentry-cli-Linux-x86_64"
        sha256 "46b6d913e3bfeccaf3170493942120a1b7b11b07c04e932b8fa643187c621fdf"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.4/sentry-cli-Linux-i686"
        sha256 "abb2f9daeb78ba01ae3f2c36e4d64fb54fd3e937683c25f980872331c2a0e1b3"
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
