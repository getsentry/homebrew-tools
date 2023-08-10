class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.20.5"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.20.5/sentry-cli-Darwin-universal"
    sha256 "d4220bd4c1f39bedc520fd9da2a9b7cca0639cb9490dd2a8be4aa8e0d586b73f"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.5/sentry-cli-Linux-aarch64"
        sha256 "d111f436e48893dbf19e8894d48a5001a2d702fcec98af8dc0d45c7ee8d885cf"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.5/sentry-cli-Linux-armv7"
        sha256 "447133803f9fa20e484449facf9251d28474694fc1cb78bd0d5bb8ec4be9a30e"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.5/sentry-cli-Linux-x86_64"
        sha256 "7f949b842cc5c48e6fe291469f972df915c68db53d0ff0b51cf8d30dd90cd719"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.5/sentry-cli-Linux-i686"
        sha256 "21a2f454006e48222ec7c92ea9be2bee19b2013ebcb78e83eb9d062f3ec87f60"
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
