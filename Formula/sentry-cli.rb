class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.3.2"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.3.2/sentry-cli-Darwin-universal"
    sha256 "04f38c69fa75f513e7ff1688253305505dce05a07e53ac65bcd2bb7ee4dd68d4"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.2/sentry-cli-Linux-aarch64"
        sha256 "5960bf8b3076cf792c84f20a1612ad720f74b934bfcc597c6f8e66e73a8c1a77"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.2/sentry-cli-Linux-armv7"
        sha256 "f7c25140af5f4278ec31abce17f122f03bf8acde5fff8d5759b8434d38dc875e"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.2/sentry-cli-Linux-x86_64"
        sha256 "0e3b2e4b572d1ea6bfc45c7a9fa6fb44a1978cdf224f715f70bb6c33b9a669bd"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.2/sentry-cli-Linux-i686"
        sha256 "e816208e4f8c6dc404c29a1a90e0685cb0ada7e9a0c98283cecc0f6c46eb575d"
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
