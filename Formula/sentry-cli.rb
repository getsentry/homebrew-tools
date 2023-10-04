class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.21.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.21.2/sentry-cli-Darwin-universal"
    sha256 "805faf6e05247e5d6e8c755321eeaadac37686a54d4cf2fdde7d62fc54ab33df"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.2/sentry-cli-Linux-aarch64"
        sha256 "aa6085a9b24e349dbcef301127aebc6e8c3adfa8389964df5e91d96b3fb92e08"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.2/sentry-cli-Linux-armv7"
        sha256 "c208f78196cb14a6b3758d934e0d8ade32d784fe6d3b6ad32996976a5ee85172"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.2/sentry-cli-Linux-x86_64"
        sha256 "0016d21b20d6b83fe10d514d10ca1dbed854e8694d71fada9749e702730ed728"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.2/sentry-cli-Linux-i686"
        sha256 "f354aaa0c4942820ed5c342a384c23dc077ccdd106dcb858d966812e3757c8ed"
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
