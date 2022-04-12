class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.0.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.0.0/sentry-cli-Darwin-universal"
    sha256 "edeaf887e46fb7c8702463ab0821502bba2f41c3cb497507fb3bfbe4635727c4"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.0/sentry-cli-Linux-aarch64"
        sha256 "43d08d15409aec8925c84364a9976ef00ceed7bb78343151a6705c5fd735833f"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.0/sentry-cli-Linux-armv7"
        sha256 "850b0d0c0f1995c34fd9721cf83783d29ab7f32d486273c09348af42f66ecf87"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.0/sentry-cli-Linux-x86_64"
        sha256 "f1231a5d8d2c0d2a96b61ddf85ad10274731cb904665593bc02427c130728084"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.0/sentry-cli-Linux-i686"
        sha256 "a83ce83846d8d7456212e3224b34e0da7213611e49d75e8aa58ccd2f3219220e"
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
