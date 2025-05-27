class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.46.0-alpha"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.46.0-alpha/sentry-cli-Darwin-universal"
    sha256 "317d34edfa9ca75a4e40c76a12fff878dfec15ae4f4e51d710952f05d4635def"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.46.0-alpha/sentry-cli-Linux-aarch64"
        sha256 "fb90b86236d4afd5b726096fe91408ef42961bb962dd84f6a70622bf8d1a1adf"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.46.0-alpha/sentry-cli-Linux-armv7"
        sha256 "09c79dc553258f7b6c8cfd7be3926c8ce3739af0fee5230810d68cd72ef14830"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.46.0-alpha/sentry-cli-Linux-x86_64"
        sha256 "65f59031f8f5f45acf6998c491aec3f8fddc7607339eb7d3037e3c9dd79d365a"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.46.0-alpha/sentry-cli-Linux-i686"
        sha256 "ec9352e11ba8313877383d05fa0a77a38f57f806d2ffd3ae06efecb13508e719"
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
