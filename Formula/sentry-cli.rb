class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.70.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.70.0/sentry-cli-Darwin-universal"
    sha256 "a5ecda383baae3a56a36cbaef00b5d160252861e459c26a4594cfe37b193accd"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.70.0/sentry-cli-Linux-aarch64"
        sha256 "0dd790f8d8cd3e80d7835aa37a7ca65bfd95548fcfb451381c7542c9032d6ae8"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.70.0/sentry-cli-Linux-armv7"
        sha256 "0f1a3f091ee5391a1ca5978c74641c3989b08a00b1ec93dba36d93cff8209910"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.70.0/sentry-cli-Linux-x86_64"
        sha256 "a63682c4305c74ed569a0b1fee3c031a55c17f1f047a422cc87ba87b2a3123d5"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.70.0/sentry-cli-Linux-i686"
        sha256 "7bee4a0849fd3c2084b62e8c69060654db5be89b8bdc201c20709aa8a55a2761"
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
