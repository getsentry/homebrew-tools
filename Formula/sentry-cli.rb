class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.18.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.18.0/sentry-cli-Darwin-universal"
    sha256 "55f4aafa697598816d8dfd8c0ded12393dd6db39f43d830d0c3b7a81b39edad8"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.18.0/sentry-cli-Linux-aarch64"
        sha256 "c13c8ce3c407401dfd29f17b9770d67ced70415b027a9325ed25685fc0c7ef6f"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.18.0/sentry-cli-Linux-armv7"
        sha256 "51e03c5b4d0e8ab8c12a5b15ca09b4db87f5ba6943baca4e2ae4cce2837e57bd"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.18.0/sentry-cli-Linux-x86_64"
        sha256 "3eafddcc1affcc97afb210b30c60bb85eda3a67eb658e1ee6fa9230aa717e244"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.18.0/sentry-cli-Linux-i686"
        sha256 "68f7b1972300b4b9652745765163caa3a86609c4f2686ce8d85fa27becc63407"
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
