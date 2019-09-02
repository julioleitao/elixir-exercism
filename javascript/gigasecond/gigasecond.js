const GIGA_SECOND = 10 ** 9;

export const gigasecond = (date) => {
  const seconds = GIGA_SECOND - (date.getTime() / 1000);
  var t = date; // Epoch
  t.setSeconds(seconds);
  return t;
};
