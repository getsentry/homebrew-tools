class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.61.0"
  license "BSD-3-Clause"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://downloads.sentry-cdn.com/sentry-cli/1.61.0/sentry-cli-Darwin-arm64"
      sha256 "d19bec8291f06b98f0632e0e6c421ba99f21597c667eb27bbc1bdbcdf410a33d"
    else
      url "https://downloads.sentry-cdn.com/sentry-cli/1.61.0/sentry-cli-Darwin-x86_64"
      sha256 "ca3037b0174e36edbc72e9787804d2e801958d7a4af24576463bf3d60745a4a7"
    end
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.61.0/sentry-cli-Linux-x86_64"
    sha256 "fb829f963e43a80c02d4fcd3fa7534a746bcccaa171df149738dc4a203213fde"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.61.0/sentry-cli-Linux-i686"
    sha256 "4746c95c5ef52b9e4f1213821b07d01351a8c983c06f5b596386bc5d3c9c959e"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
