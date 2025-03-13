class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.42.3"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.42.3/sentry-cli-Darwin-universal"
    sha256 "807338701a53a6239958c81a796c0f61c7e4c25312e5be34779d057c631bffd4"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.3/sentry-cli-Linux-aarch64"
        sha256 "428b6de82b25c9b5c6093719d0595090e7ec050e688f74b1edf669d24b3ff1a8"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.3/sentry-cli-Linux-armv7"
        sha256 "05c2dde2b8ebeb5ff148e2b4b11e6d15f985059fcb123faeae505f3324b46f78"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.3/sentry-cli-Linux-x86_64"
        sha256 "fb12375ff28eedc04acbd4d3af500a2f479d9c6188bf60246eea563f35a8f98f"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.3/sentry-cli-Linux-i686"
        sha256 "cc5c59f0cb2c4db4e9cf795361d6372cb612fa12ab886eb86ba84367f7fe3ff9"
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
