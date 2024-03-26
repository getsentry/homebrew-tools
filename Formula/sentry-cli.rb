class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.30.3"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.30.3/sentry-cli-Darwin-universal"
    sha256 "532ddaf19c2acc55ae45ee489296d8066061ab5d53add03834d0f6b5e9c9e4bf"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.3/sentry-cli-Linux-aarch64"
        sha256 "6ca730d5858b685dc341aec45c4c54441e502dec4ed328f0c43a32ad57a68941"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.3/sentry-cli-Linux-armv7"
        sha256 "961e06a22e8727799f1ecd0bce1ad09bcb03b6ad48a02fe302a22b89be28ad01"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.3/sentry-cli-Linux-x86_64"
        sha256 "797078290444dcfa5de6237bb171809d471d1354bdef778fa5b5feedc3c24a69"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.3/sentry-cli-Linux-i686"
        sha256 "394a48f3f8860e3791d458c514e06730f871b5c7f86c9e933bfc45cf8467b96b"
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
