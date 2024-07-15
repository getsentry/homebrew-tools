class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.32.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.32.2/sentry-cli-Darwin-universal"
    sha256 "e420908b480fe4e7d280df86392b1c3785e252bed14b53c18df3e4701d1b82e3"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.32.2/sentry-cli-Linux-aarch64"
        sha256 "b74cb1b7ea58ffc984c873442f2dd9610c680cfce6e333ad6f37cb6ae0ae4275"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.32.2/sentry-cli-Linux-armv7"
        sha256 "2bfc107dd0b3671771674b50a4332e7f1912a7fd991c59b1cfe34b6043ac0658"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.32.2/sentry-cli-Linux-x86_64"
        sha256 "c69097afb8de93417805b521490adca1a5f35f3453da837273c1738392628710"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.32.2/sentry-cli-Linux-i686"
        sha256 "663d73e161062905ccfa8caff7287592d0b709f6e4c26b2b2083e6d46adc4a41"
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
