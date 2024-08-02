class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.33.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.33.1/sentry-cli-Darwin-universal"
    sha256 "29de180bb210628110fa1048e46dd856a9a27bcc4c6e57873427538f5b624a75"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.33.1/sentry-cli-Linux-aarch64"
        sha256 "93b3a39c0498410b873f6c2c6d6ee281703aa389afa149acffdb9a9e45167add"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.33.1/sentry-cli-Linux-armv7"
        sha256 "3afa6e8b49b8826fea4fd137d3ac78879410629db6c09baf6caf22da4d1fd1da"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.33.1/sentry-cli-Linux-x86_64"
        sha256 "f67c549d58467be3c2d387b42e52dc62502b14af0fee74c11c23e3fa75574d96"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.33.1/sentry-cli-Linux-i686"
        sha256 "7fa5b500256d9726f74882b7117fe19605831931a0c3e9df9b56e0146e98b9e6"
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
