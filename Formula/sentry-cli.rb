class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.33.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.33.0/sentry-cli-Darwin-universal"
    sha256 "3a8d31d4189c90054198b215d26f21d50f622f134036ff3f573b42e124669ec3"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.33.0/sentry-cli-Linux-aarch64"
        sha256 "10b142d6aa67e0f678a15bee4e7b8699b0305f3c813f9cfbf67ec112b7a01a90"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.33.0/sentry-cli-Linux-armv7"
        sha256 "3cdc85a113fe6805e468b6771c28682fd85e2670b6ab92da9b93174a9d7bc064"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.33.0/sentry-cli-Linux-x86_64"
        sha256 "652fe25aef94870b7a266a97e9c1cab3b6f09b1b9629e9729ffc18358c1fc0e7"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.33.0/sentry-cli-Linux-i686"
        sha256 "cae978b1345de79c9b04e316e2c3c5f305d76e12e8a206af7b4e120869233aba"
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
