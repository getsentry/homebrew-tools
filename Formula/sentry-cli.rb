class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.58.5"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.58.5/sentry-cli-Darwin-universal"
    sha256 "545d98b9dcc7ce6f52013f72665fa67e36bfc0672abdb19ab78a2f85729b1230"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.5/sentry-cli-Linux-aarch64"
        sha256 "c93b7458ace745fe7cf7aac6e346e34b9ea4f33b7d62f70d722f82108729aaff"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.5/sentry-cli-Linux-armv7"
        sha256 "24ac3a991b2742d2e0ab3c6776d02ed7717b1a8778f092337fd6167339e93554"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.5/sentry-cli-Linux-x86_64"
        sha256 "48eb3b98cbe1cc2331b6d04591c22fa9c0d948d0b3da33164bb76f038f290750"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.5/sentry-cli-Linux-i686"
        sha256 "81afd6a2077569f3c39de2c3e427e09cd832cb609f0e7494d6371961295df99b"
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
