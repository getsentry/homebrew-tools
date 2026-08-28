class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.7.0"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.7.0/sentry-cli-Darwin-universal"
    sha256 "10ccaaa39e6eee2b52034546f5f617533fdc76c64aa75c3038887045da1a367d"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.7.0/sentry-cli-Linux-aarch64"
        sha256 "69cc0e951f663a332fd3bb3069e443cb3748abbfce497ae2caac6d5a9ec7ae65"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.7.0/sentry-cli-Linux-armv7"
        sha256 "2131a93688800965abe550e029d19993038352f788bc3eeecf4582947154121b"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.7.0/sentry-cli-Linux-x86_64"
        sha256 "cec71d46a7cc394c94b6e75f1601985c710d457376c546ef3975567b3671563b"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.7.0/sentry-cli-Linux-i686"
        sha256 "1d57c92d15265425dbf43df9b9e6395ff9bb5c2eaf60adb541dadc3f866715fa"
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
