class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.63.1"
  license "BSD-3-Clause"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.63.1/sentry-cli-Darwin-universal"
    sha256 "0c1ac3dc993a4aa169d49a989ce35bdfc4c463339652a2d3e44aef17c03fa976"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.63.1/sentry-cli-Linux-aarch64"
        sha256 "76dacbc3cdda57257ccd1e9bb35d201c6c22bb3d25f2e92183f111d956960e94"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.63.1/sentry-cli-Linux-armv7"
        sha256 "22bc172de2e5323f8e7d038ee117e1e77e8c2aed685dc983eefee9ab4d0b476f"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.63.1/sentry-cli-Linux-x86_64"
        sha256 "55701a409dea593d48b560a6444a4216ecfa43f853428f4df1c1c89f32f5f9a0"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.63.1/sentry-cli-Linux-i686"
        sha256 "18060660a00dc19a32367e6e05cb295cf58f99aaf6cb97875a5b5bc5b22ebe94"
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
