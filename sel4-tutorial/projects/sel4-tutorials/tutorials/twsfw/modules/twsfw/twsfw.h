#ifndef _TWSFW_H_
#define _TWSFW_H_

#include <linux/types.h>

#define DEVICE_INTF_NAME "twsfw_file"
#define DEVICE_MAJOR_NUM 100


/* Mode of an instruction */
enum twsfw_mode {
	TWSFW_NONE = 0,
	TWSFW_ADD = 1,
	TWSFW_REMOVE = 2,
	TWSFW_VIEW = 3
};


/* Filter rule of MiniFirewall */
struct twsfw_rule {
	uint32_t in;
	uint32_t s_ip;
	uint32_t s_mask;
	uint16_t s_port;
	uint32_t d_ip;
	uint32_t d_mask;
	uint16_t d_port;
	uint8_t proto;
};


/* Control instruction */
struct twsfw_ctl {
	enum twsfw_mode mode;
	struct twsfw_rule rule;
};

#endif
