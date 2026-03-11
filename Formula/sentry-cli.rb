class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.3.3"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.3.3/sentry-cli-Darwin-universal"
    sha256 "db0ef52f3278b7fb8e0b9d23a17d407815771c4348c024740fa3482a764764b8"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.3/sentry-cli-Linux-aarch64"
        sha256 "1951e009ddb6a0ae71449f2ec479a04a29178511f0f7f8a70640f57ff0705758"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.3/sentry-cli-Linux-armv7"
        sha256 "f2da74096c31b79d60e96a1fe2d2dacef1896c60f024257e7a2dd14b7360fdbd"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.3/sentry-cli-Linux-x86_64"
        sha256 "560ccecdf6e95ffa206eba4ea57ee33a03f8ad38bc80ae4567438c11613d3b46"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.3/sentry-cli-Linux-i686"
        sha256 "505a669cfac38463e51b911adfd8f484fda428980c9ad59e5904878e8a5dfd7d"
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
