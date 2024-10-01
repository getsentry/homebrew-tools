class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.36.5"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.36.5/sentry-cli-Darwin-universal"
    sha256 "10aaef60223c497839f89dd2d5ea79fc801dddca712898ef0cd4290a4c004b1a"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.5/sentry-cli-Linux-aarch64"
        sha256 "633f4859816d18e288563cd60d5027804be4e61da27191e846f24ba52c30e20a"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.5/sentry-cli-Linux-armv7"
        sha256 "6375575a256a07d1dd9315c7e02847b7cfe998bf5be99b8863389470a64330e2"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.5/sentry-cli-Linux-x86_64"
        sha256 "5696cb1eb0238190b86f18ac2036f89524bfdb2ecd12d1a11a488d2e93fb5024"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.5/sentry-cli-Linux-i686"
        sha256 "fedefbf354a30757371689195e7518c712f8670782eeaffa4c8dea17fb3c610d"
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
